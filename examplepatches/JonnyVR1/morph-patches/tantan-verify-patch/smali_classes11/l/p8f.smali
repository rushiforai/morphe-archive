.class public final synthetic Ll/p8f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:Ll/fe80;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/fe80;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p8f;->a:Ll/fe80;

    iput p2, p0, Ll/p8f;->b:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p8f;->a:Ll/fe80;

    iget p0, p0, Ll/p8f;->b:I

    check-cast p1, Lcom/google/android/exoplayer2/t$d;

    invoke-static {v0, p0, p1}, Lcom/google/android/exoplayer2/i;->p(Ll/fe80;ILcom/google/android/exoplayer2/t$d;)V

    return-void
.end method
