.class public final Lfk5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final a:Lt5d;

.field public final b:Lz77;

.field public final c:Leej;

.field public final d:Lzv3;

.field public final e:Lr9c;

.field public final f:Lcom/opera/android/PushedContentHandler;

.field public final g:Lx5f;

.field public final h:Lx5f;

.field public final i:Lcom/opera/android/Lazy;

.field public final j:Lwv1;


# direct methods
.method public constructor <init>(Lt5d;Lz77;Leej;Lzv3;Lr9c;Lcom/opera/android/PushedContentHandler;Lx5f;Lx5f;Lcom/opera/android/Lazy;Lwv1;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfk5;->a:Lt5d;

    iput-object p2, p0, Lfk5;->b:Lz77;

    iput-object p3, p0, Lfk5;->c:Leej;

    iput-object p4, p0, Lfk5;->d:Lzv3;

    iput-object p5, p0, Lfk5;->e:Lr9c;

    iput-object p6, p0, Lfk5;->f:Lcom/opera/android/PushedContentHandler;

    iput-object p7, p0, Lfk5;->g:Lx5f;

    iput-object p8, p0, Lfk5;->h:Lx5f;

    iput-object p9, p0, Lfk5;->i:Lcom/opera/android/Lazy;

    iput-object p10, p0, Lfk5;->j:Lwv1;

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Leb8;

    new-instance v0, Lip1;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Lip1;-><init>(Ljava/lang/Object;B)V

    iget-boolean p0, p1, Leb8;->b:Z

    if-eqz p0, :cond_d

    return-void

    :cond_d
    const/4 p0, 0x1

    iput-boolean p0, p1, Leb8;->b:Z

    iget-object p0, p1, Leb8;->a:Lek5;

    invoke-virtual {v0, p0}, Lip1;->accept(Ljava/lang/Object;)V

    return-void
.end method
