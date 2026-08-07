.class public final Ll/tsu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/tsu0;->a:Ll/kqx0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/tsu0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast p0, Ll/z5u0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/z5u0;->a()Ll/o7w0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Ll/o7w0;->o:Ll/x6w0;

    .line 10
    .line 11
    iget p0, p0, Ll/x6w0;->a:I

    .line 12
    .line 13
    const/4 v0, 0x3

    .line 14
    if-ne p0, v0, :cond_0

    .line 15
    .line 16
    const-string p0, "rewarded_interstitial"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    const-string p0, "rewarded"

    .line 20
    .line 21
    return-object p0
.end method
