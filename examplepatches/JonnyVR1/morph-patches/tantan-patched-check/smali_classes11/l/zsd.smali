.class public final synthetic Ll/zsd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tp80;


# instance fields
.field public final synthetic a:Ll/atd;


# direct methods
.method public synthetic constructor <init>(Ll/atd;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zsd;->a:Ll/atd;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zsd;->a:Ll/atd;

    check-cast p1, Lcom/google/android/exoplayer2/k;

    invoke-static {p0, p1}, Ll/atd;->r(Ll/atd;Lcom/google/android/exoplayer2/k;)Z

    move-result p0

    return p0
.end method
