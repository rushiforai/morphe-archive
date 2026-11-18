/*
 * Ported from Bencho's rolling-counter and seek blocks (lab/spring), MIT License.
 * Copyright (c) 2026 Lorenzo Cabra
 */
package io.github.sabopura.morphe.extension.twitch.ui;

/** The per-frame spring of the free Bencho blocks: {@code frames} is in sixtieths of a second and damping is raised to it. */
final class FrameSpring {
    double position;
    double velocity;
    double target;

    FrameSpring(double value) {
        position = value;
        target = value;
    }

    static double stiffnessOf(double tune) {
        return 0.08 + tune / 100 * 0.16;
    }

    static double decayOf(double tune) {
        return 0.62 + tune / 100 * 0.2;
    }

    /** One frame; returns true while moving. {@code snap} is the rest threshold on distance and velocity. */
    boolean step(double frames, double stiffness, double decay, double snap) {
        velocity += (target - position) * stiffness * frames;
        velocity *= Math.pow(decay, frames);
        position += velocity * frames;
        if (Math.abs(target - position) >= snap || Math.abs(velocity) >= snap) return true;
        position = target;
        velocity = 0;
        return false;
    }
}
