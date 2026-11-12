.class public final enum Ll7j;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Ll7j;

.field public static final enum c:Ll7j;

.field public static final synthetic d:[Ll7j;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Ll7j;

    const-string v1, "DEVICE_DEFAULT"

    const/4 v2, 0x0

    const-string v3, ""

    invoke-direct {v0, v1, v2, v3}, Ll7j;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Ll7j;->b:Ll7j;

    new-instance v1, Ll7j;

    const/4 v2, 0x1

    const-string v4, "https://opera.cloudflare-dns.com/dns-query"

    const-string v5, "CLOUDFLARE"

    invoke-direct {v1, v5, v2, v4}, Ll7j;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Ll7j;

    const/4 v4, 0x2

    const-string v5, "https://dns.google/dns-query{?dns}"

    const-string v6, "GOOGLE"

    invoke-direct {v2, v6, v4, v5}, Ll7j;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v4, Ll7j;

    const-string v5, "CUSTOM"

    const/4 v6, 0x3

    invoke-direct {v4, v5, v6, v3}, Ll7j;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v4, Ll7j;->c:Ll7j;

    filled-new-array {v0, v1, v2, v4}, [Ll7j;

    move-result-object v0

    sput-object v0, Ll7j;->d:[Ll7j;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Ll7j;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ll7j;
    .registers 2

    const-class v0, Ll7j;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ll7j;

    return-object p0
.end method

.method public static values()[Ll7j;
    .registers 1

    sget-object v0, Ll7j;->d:[Ll7j;

    invoke-virtual {v0}, [Ll7j;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ll7j;

    return-object v0
.end method
