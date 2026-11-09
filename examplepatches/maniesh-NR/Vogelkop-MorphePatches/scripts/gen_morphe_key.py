#!/usr/bin/env python3
"""Generate an Ed25519 keypair in the exact format of Morphe's BundleSigning:
private key = 32-byte raw seed, base64; public key = 32-byte raw, base64."""
import base64, sys
from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PrivateKey
from cryptography.hazmat.primitives.serialization import Encoding, PublicFormat

priv = Ed25519PrivateKey.generate()
priv_raw = priv.private_bytes_raw()      # 32-byte seed == BC Ed25519PrivateKeyParameters
pub_raw = priv.public_key().public_bytes(Encoding.Raw, PublicFormat.Raw)  # == BC Ed25519PublicKeyParameters

open(sys.argv[1], "w").write(base64.b64encode(priv_raw).decode() + "\n")
open(sys.argv[2], "w").write(base64.b64encode(pub_raw).decode() + "\n")
print("public key:", base64.b64encode(pub_raw).decode())
