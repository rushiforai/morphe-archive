#!/usr/bin/env python3
"""Generate and check the original static R8 blue-noise threshold tile.

Requires Python 3.10+ and numpy (validated with 2.3.3). No borrowed texture or
runtime PRNG is used. The void-and-cluster ranking uses a periodic integer
Gaussian energy, explicit tie-breaking, and SplitMix64 for its initial seed.
Run this file to regenerate the binary/header/validation receipt; --check
reproduces all outputs in memory and rejects a stale checked-in result.

The texture quantizes final encoded RGB, after calibration/fade. Input precision
is not changed: both 8-bit and 10-bit decoder samples use the same 8-bit output
rule. These are arithmetic and spatial checks, not GPU/headset validation.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
from pathlib import Path

import numpy as np


WIDTH = 128
PIXELS = WIDTH * WIDTH
SEED = 0x475852424C554531
WHITE_SEED = 0x4758525748495445
SIGMA = 1.5
ENERGY_SCALE = 1 << 24
MEAN_ERROR_BOUND = 1.0 / 512.0
MASK64 = (1 << 64) - 1


def permutation(seed: int) -> np.ndarray:
    """Fisher-Yates with explicit SplitMix64; independent of numpy RNG changes."""
    order = np.arange(PIXELS, dtype=np.int32)
    state = seed
    for last in range(PIXELS - 1, 0, -1):
        state = (state + 0x9E3779B97F4A7C15) & MASK64
        value = state
        value = ((value ^ (value >> 30)) * 0xBF58476D1CE4E5B9) & MASK64
        value = ((value ^ (value >> 27)) * 0x94D049BB133111EB) & MASK64
        value ^= value >> 31
        chosen = value % (last + 1)
        order[last], order[chosen] = order[chosen], order[last]
    return order


def gaussian_kernel() -> np.ndarray:
    """Integer energies keep ranking exact, including cross-platform ties."""
    distances = [min(coordinate, WIDTH - coordinate) for coordinate in range(WIDTH)]
    return np.array(
        [
            [
                int(math.floor(math.exp(-(x * x + y * y) / (2 * SIGMA * SIGMA))
                               * ENERGY_SCALE + 0.5))
                for x in distances
            ]
            for y in distances
        ],
        dtype=np.int64,
    )


def generate_tile() -> tuple[np.ndarray, int]:
    kernel = gaussian_kernel()
    occupied = np.zeros((WIDTH, WIDTH), dtype=bool)
    density = np.zeros((WIDTH, WIDTH), dtype=np.int64)
    initial_count = PIXELS // 10

    def shifted(index: int) -> np.ndarray:
        return np.roll(kernel, (index // WIDTH, index % WIDTH), axis=(0, 1))

    def cluster() -> int:
        # Flattened argmin/argmax always break a tie at the lowest row-major index.
        return int(np.argmax(np.where(occupied, density, -1)))

    def void() -> int:
        return int(np.argmin(np.where(occupied, np.iinfo(np.int64).max, density)))

    for index in permutation(SEED)[:initial_count]:
        occupied.flat[index] = True
        density += shifted(int(index))

    # Relax the seed. Accept only strictly energy-decreasing moves, which both
    # guarantees termination and avoids cycling when integer energies tie.
    relocations = 0
    while True:
        removed = cluster()
        occupied.flat[removed] = False
        density -= shifted(removed)
        added = void()
        if density.flat[added] >= density.flat[removed]:
            occupied.flat[removed] = True
            density += shifted(removed)
            break
        occupied.flat[added] = True
        density += shifted(added)
        relocations += 1
        if relocations > PIXELS * 100:
            raise AssertionError("Void-and-cluster relaxation did not converge")

    initial_pattern = occupied.copy()
    initial_density = density.copy()
    ranks = np.full((WIDTH, WIDTH), -1, dtype=np.int32)

    # Descending ranks: progressively remove the tightest remaining cluster.
    for rank in range(initial_count - 1, -1, -1):
        index = cluster()
        ranks.flat[index] = rank
        occupied.flat[index] = False
        density -= shifted(index)

    # Ascending ranks: progressively fill the largest void. Above 50% coverage,
    # this is equivalent to removing the tightest cluster in the complement,
    # because every toroidal kernel has the same summed energy.
    occupied[:] = initial_pattern
    density[:] = initial_density
    for rank in range(initial_count, PIXELS):
        index = void()
        ranks.flat[index] = rank
        occupied.flat[index] = True
        density += shifted(index)

    assert np.array_equal(np.sort(ranks.ravel()), np.arange(PIXELS))
    return (ranks // (PIXELS // 256)).astype(np.uint8), relocations


def output_codes(encoded: np.ndarray, thresholds: np.ndarray) -> np.ndarray:
    """The shader's ideal-real arithmetic, measured in 8-bit output code units."""
    return np.floor(np.clip(encoded[:, None], 0.0, 1.0) * 255.0 + thresholds[None, :])


def arithmetic_checks(tile: np.ndarray) -> dict:
    histogram = np.bincount(tile.ravel(), minlength=256)
    assert np.all(histogram == PIXELS // 256)
    # 256 distinct thresholds have equal weight, so checking these is exactly
    # equivalent to evaluating a spatially constant input over the complete tile.
    thresholds = (np.arange(256, dtype=np.float64) + 0.5) / 256.0
    exact = np.arange(256, dtype=np.float64) / 255.0
    assert np.all(output_codes(exact, thresholds) == np.arange(256)[:, None])
    assert np.all(output_codes(np.array([-2.0, 0.0]), thresholds) == 0.0)
    assert np.all(output_codes(np.array([1.0, 3.0]), thresholds) == 255.0)

    cases = {}
    for bits in (8, 10):
        ramp = np.arange(1 << bits, dtype=np.float64) / ((1 << bits) - 1)
        for gain in (0.97, 1.0, 1.037):
            for offset in (-1.0 / 1024.0, 0.0, 1.0 / 2048.0):
                for fade in (0.0, 0.125, 0.37, 0.999, 1.0):
                    encoded = (ramp * gain + offset) * fade
                    codes = output_codes(encoded, thresholds)
                    assert np.all(np.diff(codes, axis=0) >= 0)
                    target = np.clip(encoded, 0.0, 1.0) * 255.0
                    # Each pixel chooses an adjacent code; no spatial averaging.
                    assert np.all(codes >= np.floor(target[:, None]))
                    assert np.all(codes <= np.ceil(target[:, None]))
                    error = float(np.max(np.abs(np.mean(codes, axis=1) - target)))
                    assert error <= MEAN_ERROR_BOUND + 1e-12
                    name = f"{bits}bit_gain={gain}_offset={offset}_fade={fade}"
                    cases[name] = error

    # Sweep all fractional threshold boundaries and nearby values. The finite
    # threshold bias bound is independent of the integer part of an output code.
    max_error = 0.0
    samples = 0
    for start in range(0, 65537, 1024):
        fractions = np.arange(start, min(start + 1024, 65537)) / 65536.0
        code_values = 127.0 + fractions
        encoded = code_values / 255.0
        codes = output_codes(encoded, thresholds)
        error = float(np.max(np.abs(np.mean(codes, axis=1) - code_values)))
        max_error = max(max_error, error)
        samples += len(fractions)
    assert max_error <= MEAN_ERROR_BOUND + 1e-12

    # Model GLSL highp float separately. Binary32 may move a threshold crossing
    # by a few ULPs; report that implementation effect instead of silently
    # attributing the ideal-real bound to finite GPU arithmetic.
    float32_worst = 0.0
    stored_r8 = np.arange(256, dtype=np.float32) / np.float32(255)
    float32_thresholds = (stored_r8 * np.float32(255) + np.float32(0.5)) / np.float32(256)
    assert np.array_equal(float32_thresholds, thresholds.astype(np.float32))
    for bits in (8, 10):
        ramp = np.arange(1 << bits, dtype=np.float32) / np.float32((1 << bits) - 1)
        for gain, offset, fade in ((1.0, 0.0, 1.0), (0.97, -1 / 1024, 0.37),
                                   (1.037, 1 / 2048, 0.999)):
            encoded = (ramp * np.float32(gain) + np.float32(offset)) * np.float32(fade)
            target32 = np.clip(encoded, np.float32(0), np.float32(1)) * np.float32(255)
            codes = np.floor(target32[:, None] + float32_thresholds[None, :])
            encoded_output = codes / np.float32(255)
            # Encoding the quantized result into UNORM8 must retain its code.
            assert np.array_equal(np.floor(encoded_output * np.float32(255)
                                           + np.float32(0.5)), codes)
            error = float(np.max(np.abs(codes.mean(axis=1, dtype=np.float64)
                                        - target32.astype(np.float64))))
            float32_worst = max(float32_worst, error)
            assert error <= MEAN_ERROR_BOUND + float(np.spacing(np.float32(255)))

    return {
        "input_bits": [8, 10],
        "output_bits": 8,
        "formula": "floor(clamp(encoded_rgb,0,1)*255+(byte+0.5)/256)/255",
        "calibration_and_fade_cases": len(cases),
        "calibration_and_fade_max_mean_error_codes": max(cases.values()),
        "fractional_samples": samples,
        "fractional_max_mean_error_codes": max_error,
        "ideal_mean_error_bound_codes": MEAN_ERROR_BOUND,
        "float32_max_mean_error_codes": float32_worst,
        "float32_allowed_extra_error_codes": float(np.spacing(np.float32(255))),
        "passed": ["endpoints", "clamping", "all_256_exact_output_codes",
                   "8_and_10_bit_inputs", "calibration_and_fade", "monotonicity",
                   "adjacent_codes_only", "finite_threshold_mean_bound",
                   "r8_threshold_decode", "unorm8_output_roundtrip"],
    }


def spatial_checks(tile: np.ndarray) -> dict:
    white = tile.ravel()[permutation(WHITE_SEED)].reshape(tile.shape)
    frequency = np.fft.fftfreq(WIDTH) * WIDTH
    radius = np.sqrt(frequency[:, None] ** 2 + frequency[None, :] ** 2)
    low_band = (radius >= 1.0) & (radius <= 8.0)

    def power(values: np.ndarray) -> np.ndarray:
        centred = values.astype(np.float64) - np.mean(values)
        return np.abs(np.fft.fft2(centred)) ** 2 / PIXELS

    def low_ratio(values: np.ndarray, baseline: np.ndarray) -> float:
        return float(np.mean(power(values)[low_band]) / np.mean(power(baseline)[low_band]))

    intensity_ratio = low_ratio(tile, white)
    assert intensity_ratio < 0.15, f"Tile low-frequency ratio {intensity_ratio}"
    threshold_ratios = {}
    for threshold in (16, 32, 64, 128, 192, 224, 240):
        ratio = low_ratio(tile < threshold, white < threshold)
        assert ratio < 0.2, f"Threshold {threshold} low-frequency ratio {ratio}"
        threshold_ratios[str(threshold)] = ratio

    # Radial power relative to the deterministic, equal-histogram white baseline.
    # The low-frequency assertion above also covers masks, which are the actual
    # rounding decisions. Testing the grayscale texture alone is insufficient.
    tile_power, white_power = power(tile), power(white)
    radial = []
    for lower, upper in ((1, 4), (4, 8), (8, 16), (16, 24), (24, 32), (32, 48), (48, 64)):
        band = (radius >= lower) & (radius < upper)
        radial.append({"radius_cycles_per_tile": [lower, upper],
                       "blue_to_white_power": float(tile_power[band].mean()
                                                    / white_power[band].mean())})
    return {
        "boundary": "periodic torus in both axes",
        "white_baseline": "deterministic shuffle of identical 256-bin histogram",
        "white_seed_hex": f"0x{WHITE_SEED:016x}",
        "low_band_cycles_per_tile": [1, 8],
        "intensity_low_power_ratio": intensity_ratio,
        "intensity_ratio_required_below": 0.15,
        "threshold_mask_low_power_ratios": threshold_ratios,
        "threshold_mask_ratio_required_below": 0.2,
        "radial_power": radial,
    }


def header_bytes(tile: np.ndarray, digest: str) -> bytes:
    rows = ["    " + ", ".join(f"0x{int(value):02x}" for value in row) + ","
            for row in tile.reshape(-1, 16)]
    text = "\n".join([
        "// Generated by generate_noise.py; do not edit.",
        f"// Original void-and-cluster R8 tile. SHA-256: {digest}",
        "#pragma once", "#include <cstddef>", "#include <cstdint>", "",
        "namespace sl_blue_noise {",
        f"static constexpr int kTileWidth = {WIDTH};",
        f"static constexpr std::size_t kTileSize = {PIXELS};",
        "static constexpr std::uint8_t kTile[kTileSize] = {", *rows,
        "};", "}  // namespace sl_blue_noise", "",
    ])
    return text.encode("ascii")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="reproduce and compare without writing")
    arguments = parser.parse_args()
    tile, relocations = generate_tile()
    binary = tile.tobytes(order="C")
    digest = hashlib.sha256(binary).hexdigest()
    receipt = {
        "generator": "generate_noise.py",
        "algorithm": "original toroidal void-and-cluster integer Gaussian ranking",
        "seed_hex": f"0x{SEED:016x}",
        "sigma": SIGMA,
        "integer_kernel_scale": ENERGY_SCALE,
        "kernel_sha256_le_i64": hashlib.sha256(gaussian_kernel().astype("<i8").tobytes()).hexdigest(),
        "relaxation_moves": relocations,
        "width": WIDTH,
        "height": WIDTH,
        "format": "GL_R8 / row-major unsigned bytes",
        "bytes": len(binary),
        "sha256": digest,
        "histogram": {"bins": 256, "occurrences_per_bin": PIXELS // 256},
        "arithmetic": arithmetic_checks(tile),
        "spatial": spatial_checks(tile),
        "limits": "CPU arithmetic/spatial validation only; no GPU, decoder, compositor or panel proof",
    }
    outputs = {
        "blue_noise_128_r8.bin": binary,
        "blue_noise_tile.h": header_bytes(tile, digest),
        "noise_validation.json": (json.dumps(receipt, indent=2) + "\n").encode("utf-8"),
    }
    directory = Path(__file__).resolve().parent
    for filename, content in outputs.items():
        path = directory / filename
        if arguments.check:
            if not path.is_file() or path.read_bytes() != content:
                raise SystemExit(f"Stale generated output: {path}")
        else:
            path.write_bytes(content)
    print(json.dumps({"mode": "verified" if arguments.check else "generated",
                      "sha256": digest, "bytes": len(binary),
                      "max_mean_error_codes": receipt["arithmetic"]["fractional_max_mean_error_codes"],
                      "low_frequency_power_ratio": receipt["spatial"]["intensity_low_power_ratio"]}))


if __name__ == "__main__":
    main()
