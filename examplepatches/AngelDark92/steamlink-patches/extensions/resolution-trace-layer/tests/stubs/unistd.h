#pragma once
// Stable fake process identity for host-only diagnostic assertions.
inline int getpid() { return 123; }
