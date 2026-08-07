.class public final Ll/lhr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bhr0;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lhr0;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Ll/bgw0;)Ll/lhr0;
    .locals 3

    .line 1
    new-instance v0, Ll/lhr0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bgw0;->q()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sget-object v2, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 8
    .line 9
    invoke-virtual {p0, v1, v2}, Ll/bgw0;->a(ILjava/nio/charset/Charset;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {v0, p0}, Ll/lhr0;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method


# virtual methods
.method public final zza()I
    .locals 0

    .line 1
    const p0, 0x6e727473

    .line 2
    .line 3
    .line 4
    return p0
.end method
