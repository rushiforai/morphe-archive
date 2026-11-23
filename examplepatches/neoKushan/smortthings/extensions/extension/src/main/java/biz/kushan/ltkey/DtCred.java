package biz.kushan.ltkey;

/** One recovered OwnerPSK credential: the OCF device id, the owner identity, and the key (hex). */
final class DtCred {
    final String di;        // cred.subjectuuid — the OCF device id this key is for
    final String identity;  // cred-resource rowneruuid — the OwnerPSK identity (owner UUID)
    final String pskHex;    // privatedata key bytes, lowercase hex (32 or 64 chars)

    DtCred(String di, String identity, String pskHex) {
        this.di = di;
        this.identity = identity;
        this.pskHex = pskHex;
    }
}
