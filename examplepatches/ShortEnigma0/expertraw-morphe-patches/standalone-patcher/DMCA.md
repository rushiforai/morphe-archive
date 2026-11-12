# DMCA Compliance, Legal Policy & Disclaimers

This document details the copyright compliance policy, DMCA Safe Harbor framework, trademark notices, and legal disclaimers for the **standalone-patcher** subproject of expertraw-morphe-patches.

---

## 1. No Proprietary or Copyrighted Software Distribution

This standalone patcher tool:
* **Does NOT host, store, mirror, link to, distribute, or bundle any copyrighted binary files, APK packages, proprietary shared libraries (`.so`), or assets** belonging to Samsung Electronics Co., Ltd. or any third party.
* **Does NOT contain proprietary or decompiled source code** of Samsung Electronics Co., Ltd. All code provided (`patch.py`, `java/src/`, `smali/`) consists solely of original open-source utility code, differential bytecode edits, and independent stub implementations.
* **Operates strictly as a local client-side transformation utility.** The patcher requires the end user to supply their own legally acquired copy of the target APK file. All bytecode modifications and repacking occur exclusively on the user's local machine without transmitting, scraping, or redistributing proprietary assets.

---

## 2. Non-Circumvention (17 U.S.C. § 1201)

The tool does not violate the anti-circumvention provisions of the Digital Millennium Copyright Act (17 U.S.C. § 1201):
* It does **not** circumvent, bypass, or defeat any digital rights management (DRM), technological protection measure (TPM), content scrambling system, cryptography, access controls, license verification, or payment/subscription paywalls.
* The Samsung Expert RAW application is a freely distributed camera utility provided by Samsung Electronics Co., Ltd. via the Galaxy Store.
* The modifications performed by this project purely alter camera operational pipeline parameters (switching from a multi-frame computational burst stacking pipeline to a single-frame capture pathway) and provide standard open Android framework compatibility wrappers (`SafeSys`, `SafeCR`, `MediaStore`) to allow the modified application to run without Samsung's platform signature.

---

## 3. Interoperability, Fair Use & Educational Research

This tool was developed strictly for non-commercial educational research, personal customization, and software interoperability:
* **United States Code (17 U.S.C. § 107 - Fair Use):** Reverse engineering for analysis, research, and non-commercial interoperability constitutes lawful fair use.
* **United States Code (17 U.S.C. § 1201(f) - Reverse Engineering):** Permits reverse engineering of lawfully obtained computer programs for the sole purpose of identifying and analyzing elements necessary to achieve interoperability with other programs.
* **European Union (Directive 2009/24/EC, Articles 5 & 6):** Permits the observation, study, and decompilation of software for interoperability purposes by lawful users without the authorization of the copyright holder.

---

## 4. Trademark & Nominative Fair Use Notice

* "Samsung", "Galaxy", "Galaxy Store", "Expert RAW", and "One UI" are registered trademarks or service marks of Samsung Electronics Co., Ltd.
* Any reference to these trademarks, trade names, or brands in this repository, documentation, or tooling is made **solely under nominative fair use** to truthfully identify and describe the target application and hardware platforms with which this patcher is technically compatible.
* This tool is **an independent open-source effort** and is **NOT** affiliated with, authorized, sponsored, endorsed, or certified by Samsung Electronics Co., Ltd. or any of its affiliates or subsidiaries.

---

## 5. Disclaimer of Warranty & Limitation of Liability

The software, scripts, and documentation are provided **"AS IS" WITHOUT WARRANTY OF ANY KIND**, either express or implied, including but not limited to the implied warranties of merchantability, fitness for a particular purpose, or non-infringement, in accordance with Sections 15 and 16 of the GNU General Public License v3.0:
* The author and contributors shall have **NO liability** for any direct, indirect, incidental, special, exemplary, or consequential damages (including, but not limited to, data loss, device malfunction, camera hardware damage, or legal consequences) arising out of the use or inability to use this software.
* Users are solely responsible for ensuring that their use of this tool complies with all applicable local, national, and international laws, regulations, and relevant third-party terms of service.

---

## 6. DMCA Takedown Notice & Notice-and-Takedown Procedure

We respect the intellectual property rights of others and are committed to complying with the Digital Millennium Copyright Act (17 U.S.C. § 512) and international copyright legislation.

If you are a copyright owner, or an agent authorized to act on behalf of one, and you believe in good faith that any content hosted directly in this repository infringes upon your copyright, please submit a written notification of claimed infringement containing the following details pursuant to 17 U.S.C. § 512(c)(3):

1. **Identification of the copyrighted work** claimed to have been infringed, or, if multiple copyrighted works are covered by a single notification, a representative list of such works.
2. **Identification of the material** that is claimed to be infringing (including specific URLs, commit hashes, or file paths within this repository) reasonably sufficient to permit us to locate the material.
3. **Contact information** of the complaining party, including legal name, mailing address, telephone number, and email address.
4. **Good faith statement:** A statement that the complaining party has a good faith belief that use of the material in the manner complained of is not authorized by the copyright owner, its agent, or the law.
5. **Statement under penalty of perjury:** A statement that the information in the notification is accurate, and under penalty of perjury, that the complaining party is authorized to act on behalf of the owner of an exclusive right that is allegedly infringed.
6. **Signature:** A physical or electronic signature of a person authorized to act on behalf of the owner of an exclusive right that is allegedly infringed.

### Where to Send Notifications

Please direct notices of claimed infringement to:
* **GitHub Repository Issues:** [https://github.com/ShortEnigma0/expertraw-morphe-patches/issues](https://github.com/ShortEnigma0/expertraw-morphe-patches/issues)
* **Designated Maintainer Email:** `ShortEnigma0@users.noreply.github.com`

Upon receipt of a valid and verifiable notification complying with the statutory requirements above, prompt action will be taken to investigate and, where appropriate, remove or disable access to the infringing material.

