#!/usr/bin/env python3
"""
Generates synthetic PDF fixtures for Adobe Scan native PDF engine testing.
"""

import os


def create_minimal_pdf(path):
    # Minimal valid 1-page PDF
    header = b"%PDF-1.4\n"
    objects = [
        b"1 0 obj << /Type /Catalog /Pages 2 0 R >> endobj\n",
        b"2 0 obj << /Type /Pages /Kids [3 0 R] /Count 1 >> endobj\n",
        b"3 0 obj << /Type /Page /Parent 2 0 R /MediaBox [0 0 612 792] /Contents 4 0 R >> endobj\n",
        (
            b"4 0 obj << /Length 54 >> stream\n"
            b"BT /F1 12 Tf 100 700 Td (Synthetic Test Fixture) Tj ET\n"
            b"endstream\n"
            b"endobj\n"
        ),
    ]

    offsets = []
    current_offset = len(header)
    for obj in objects:
        offsets.append(current_offset)
        current_offset += len(obj)

    xref_offset = current_offset
    xref_lines = [
        b"xref\n",
        f"0 {len(objects) + 1}\n".encode("ascii"),
        b"0000000000 65535 f \n",
    ]
    for off in offsets:
        xref_lines.append(f"{off:010d} 00000 n \n".encode("ascii"))

    trailer = (
        f"trailer << /Size {len(objects) + 1} /Root 1 0 R >>\n".encode("ascii")
        + b"startxref\n"
        + f"{xref_offset}\n".encode("ascii")
        + b"%%EOF\n"
    )

    pdf_content = header + b"".join(objects) + b"".join(xref_lines) + trailer
    with open(path, "wb") as f:
        f.write(pdf_content)


def main():
    fixtures_dir = os.path.dirname(os.path.abspath(__file__))
    sample_path = os.path.join(fixtures_dir, "sample.pdf")
    create_minimal_pdf(sample_path)
    print(f"Generated {sample_path}")


if __name__ == "__main__":
    main()
