.class public final enum Lg6g;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Lg6g;


# direct methods
.method static constructor <clinit>()V
    .registers 12

    new-instance v0, Lg6g;

    const-string v1, "AUTOMATIC_SIGN_IN"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lg6g;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lg6g;

    const-string v2, "EXCLUDED_SITES"

    const/4 v4, 0x2

    invoke-direct {v1, v2, v3, v4}, Lg6g;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lg6g;

    const-string v3, "SAVE_AND_AUTOFILL_PASSWORDS"

    const/4 v5, 0x3

    invoke-direct {v2, v3, v4, v5}, Lg6g;-><init>(Ljava/lang/String;II)V

    new-instance v3, Lg6g;

    const-string v4, "AUTOFILL_IN_OTHER_APPS"

    const/4 v6, 0x4

    invoke-direct {v3, v4, v5, v6}, Lg6g;-><init>(Ljava/lang/String;II)V

    new-instance v4, Lg6g;

    const-string v5, "LOCK_PASSWORD_MANAGER"

    const/4 v7, 0x5

    invoke-direct {v4, v5, v6, v7}, Lg6g;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lg6g;

    const-string v6, "SYNC_PASSWORDS"

    const/4 v8, 0x6

    invoke-direct {v5, v6, v7, v8}, Lg6g;-><init>(Ljava/lang/String;II)V

    new-instance v6, Lg6g;

    const-string v7, "DELETE_ALL_PASSWORDS"

    const/4 v9, 0x7

    invoke-direct {v6, v7, v8, v9}, Lg6g;-><init>(Ljava/lang/String;II)V

    new-instance v7, Lg6g;

    const-string v8, "EXPORT_PASSWORDS"

    const/16 v10, 0x8

    invoke-direct {v7, v8, v9, v10}, Lg6g;-><init>(Ljava/lang/String;II)V

    new-instance v8, Lg6g;

    const-string v9, "IMPORT_PASSWORDS"

    const/16 v11, 0x9

    invoke-direct {v8, v9, v10, v11}, Lg6g;-><init>(Ljava/lang/String;II)V

    filled-new-array/range {v0 .. v8}, [Lg6g;

    move-result-object v0

    sput-object v0, Lg6g;->a:[Lg6g;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lg6g;
    .registers 2

    const-class v0, Lg6g;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lg6g;

    return-object p0
.end method

.method public static values()[Lg6g;
    .registers 1

    sget-object v0, Lg6g;->a:[Lg6g;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lg6g;

    return-object v0
.end method
