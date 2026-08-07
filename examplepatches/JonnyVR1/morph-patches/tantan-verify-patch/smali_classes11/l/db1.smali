.class public final synthetic Ll/db1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/b$a;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/b$a;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/db1;->a:Lcom/google/android/exoplayer2/b$a;

    iput p2, p0, Ll/db1;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/db1;->a:Lcom/google/android/exoplayer2/b$a;

    iget p0, p0, Ll/db1;->b:I

    invoke-static {v0, p0}, Lcom/google/android/exoplayer2/b$a;->a(Lcom/google/android/exoplayer2/b$a;I)V

    return-void
.end method
