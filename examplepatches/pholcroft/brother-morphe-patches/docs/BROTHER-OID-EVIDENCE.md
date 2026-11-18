# Brother OID evidence

The Brother-specific dictionary entries describe how **Brother Print Service Plugin 1.17.0** uses the corresponding identifiers in its locally inspected device-query table. They are observations of that app version, not claims that Brother has published these names as an official MIB. The short `brother...` symbols are identifiers chosen for this project. No app code, packet capture, response values or printer identifiers are included here.

The service's `BrotherMFCMIBTable.initializeTable` associates query keys with numeric OID prefixes. The table associates `Print.BrotherCommonPDL.Papers.Support` with `1.3.6.1.4.1.2435.2.3.9.4.2.1.5.1.2.71.12.1.2`, and checks returned text against its paper-size names. It associates `Print.BrotherCommonPDL.Support` with `...70.1.1.2` and recognises integer `17` as its common print language. It associates `Print.BrotherCommonPDL.AutoRotate` with `...69.2.1`, and scanner query keys with individual scalars under `...69.1`. The app associates other prefixes with node name, device hardware addresses, firmware version fields and function locks. See the individual JSON descriptions for the limited meanings used here.

For `...5.5.66.2.1.2`, the disc-label language query defines `1` as BRJPC and `2` as HBP. This describes the table values; it does not imply the printer supports either one without examining the relevant returned entry.

The paper-path type and interpreter-language family entries come from [RFC 3805](https://www.rfc-editor.org/rfc/rfc3805.html); their integer values come from [IANA-PRINTER-MIB](https://www.iana.org/assignments/ianaprinter-mib/ianaprinter-mib). Brother also uses the paper-path table when checking duplex support. A single table entry is not by itself a complete capability summary: the app may inspect several entries or apply additional conditions.

In Brother Print Service 1.17.0, `ConnectorDescriptor.support(String)` checks for an integer equal to 1. The app uses that check for Phoenix support and enabled status, automatic rotation, automatic scan cropping, multi-feed detection and duplex scanning. Phoenix version is read as an integer version. These labels describe the app's interpretation of the raw values.

The function-lock query handlers use different encodings. `FuncLock` (`...63.3.0`) sets its internal flag for raw 2 and clears it for raw 1. The print and scan handlers (`...63.5.1.4.11` and `...63.5.1.4.5`) set the lock flag for raw 0 and clear it for raw 1. The lock labels follow those flags and the SDK's field names. Values outside the documented dictionary mappings remain numeric.

Unknown values remain numeric. Scanner measurement units and the meaning of the product-specific Phoenix feature have not been established and are deliberately not guessed. If a future contributor has a public Brother MIB or other authoritative source, add the source alongside any correction.
