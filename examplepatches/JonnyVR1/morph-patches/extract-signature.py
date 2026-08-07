#!/usr/bin/env python3
"""
Extract APK signature using Python (fallback when apksigner is not available)
"""

import zipfile
import hashlib
import sys
import os

def extract_signature(apk_path):
    """Extract SHA-256 signature from APK"""
    
    if not os.path.exists(apk_path):
        print(f"Error: APK file not found at {apk_path}")
        print("Please run: adb pull /data/app/~~I9ouu8Dy0osFDx6Wu-ynzA==/com.tantantribe.tribe-hlmqYxXoe5ADovZzRBpn2A==/base.apk .\\tantan-7.3.6.apk")
        return None
    
    print("=== APK Signature Extractor (Python) ===\n")
    print(f"APK found: {apk_path}\n")
    
    try:
        with zipfile.ZipFile(apk_path, 'r') as apk:
            # Look for signing certificate files
            cert_files = [f for f in apk.namelist() if f.startswith('META-INF/') and (f.endswith('.RSA') or f.endswith('.DSA') or f.endswith('.EC'))]
            
            if not cert_files:
                print("No signing certificate found in META-INF/")
                print("This APK likely uses v2/v3 signing scheme")
                print("\nTrying to extract from APK Signing Block...")
                
                # Try to read the APK Signing Block (v2/v3)
                # This is a simplified approach - full implementation would need to parse the block properly
                with open(apk_path, 'rb') as f:
                    # Read the entire file and look for the signing block
                    content = f.read()
                    
                    # Look for the APK Sig Block magic
                    magic = b'APK Sig Block 42'
                    pos = content.rfind(magic)
                    
                    if pos != -1:
                        print(f"Found APK Signing Block at position {pos}")
                        # Extract some bytes around it for hashing
                        # This is a simplified approach
                        block_start = max(0, pos - 10000)
                        block_data = content[block_start:pos+len(magic)]
                        sha256 = hashlib.sha256(block_data).hexdigest()
                        print(f"\nAPK Signing Block SHA-256 (approximate): {sha256}")
                        print("\nNote: This is not the exact certificate hash. Please install apksigner for accurate results.")
                        return None
                    else:
                        print("APK Signing Block not found")
                        return None
            
            # Process certificate files
            print(f"Found {len(cert_files)} certificate file(s):\n")
            
            for cert_file in cert_files:
                print(f"Certificate: {cert_file}")
                cert_data = apk.read(cert_file)
                sha256 = hashlib.sha256(cert_data).hexdigest()
                
                print(f"SHA-256: {sha256}")
                print()
                
                # Format for Constants.kt
                print("Add this to Constants.kt:")
                print(f'signatures = setOf("{sha256}")')
                print()
                
                return sha256
    
    except Exception as e:
        print(f"Error reading APK: {e}")
        return None

if __name__ == "__main__":
    apk_path = sys.argv[1] if len(sys.argv) > 1 else ".\\tantan-7.3.6.apk"
    extract_signature(apk_path)
