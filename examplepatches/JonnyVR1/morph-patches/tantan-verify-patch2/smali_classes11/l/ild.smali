.class public final synthetic Ll/ild;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:Ll/hk0$a;

.field public final synthetic b:Lcom/google/android/exoplayer2/metadata/Metadata;


# direct methods
.method public synthetic constructor <init>(Ll/hk0$a;Lcom/google/android/exoplayer2/metadata/Metadata;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ild;->a:Ll/hk0$a;

    iput-object p2, p0, Ll/ild;->b:Lcom/google/android/exoplayer2/metadata/Metadata;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ild;->a:Ll/hk0$a;

    iget-object p0, p0, Ll/ild;->b:Lcom/google/android/exoplayer2/metadata/Metadata;

    check-cast p1, Ll/hk0;

    invoke-static {v0, p0, p1}, Ll/wld;->m1(Ll/hk0$a;Lcom/google/android/exoplayer2/metadata/Metadata;Ll/hk0;)V

    return-void
.end method
