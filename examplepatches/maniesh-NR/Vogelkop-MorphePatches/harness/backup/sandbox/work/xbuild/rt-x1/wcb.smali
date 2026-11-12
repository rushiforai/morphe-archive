.class public final Lwcb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Llqm;

.field public final c:Leri;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Llqm;Leri;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwcb;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lwcb;->b:Llqm;

    iput-object p3, p0, Lwcb;->c:Leri;

    return-void
.end method


# virtual methods
.method public final execute()V
    .registers 9

    iget-object v0, p0, Lwcb;->a:Lcom/opera/android/BrowserActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Lcom/opera/android/BrowserActivity;->n0(ZZ)V

    const/4 v6, 0x0

    const/4 v7, 0x0

    iget-object v2, p0, Lwcb;->a:Lcom/opera/android/BrowserActivity;

    const/4 v3, 0x3

    iget-object v4, p0, Lwcb;->b:Llqm;

    iget-object v5, p0, Lwcb;->c:Leri;

    invoke-virtual/range {v2 .. v7}, Lcom/opera/android/BrowserActivity;->k1(ILlqm;Leri;ZZ)V

    return-void
.end method
