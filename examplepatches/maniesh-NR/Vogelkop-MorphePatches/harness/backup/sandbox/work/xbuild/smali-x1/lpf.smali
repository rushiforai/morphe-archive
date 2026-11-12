.class public final synthetic Llpf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:Lcom/opera/android/BrowserActivity;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Z

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Ljava/lang/String;

.field public final synthetic j:Lcom/leanplum/ActionContext;

.field public final synthetic k:Lorm;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Lcom/leanplum/ActionContext;Lorm;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llpf;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Llpf;->b:Ljava/lang/String;

    iput-object p3, p0, Llpf;->c:Ljava/lang/String;

    iput-object p4, p0, Llpf;->d:Ljava/lang/String;

    iput-object p5, p0, Llpf;->e:Ljava/lang/String;

    iput-object p6, p0, Llpf;->f:Ljava/lang/String;

    iput-boolean p7, p0, Llpf;->g:Z

    iput-object p8, p0, Llpf;->h:Ljava/lang/String;

    iput-object p9, p0, Llpf;->i:Ljava/lang/String;

    iput-object p10, p0, Llpf;->j:Lcom/leanplum/ActionContext;

    iput-object p11, p0, Llpf;->k:Lorm;

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    iget-object v10, p0, Llpf;->k:Lorm;

    move-object v11, p1

    check-cast v11, Lkotlin/Pair;

    iget-object v0, p0, Llpf;->a:Lcom/opera/android/BrowserActivity;

    iget-object v1, p0, Llpf;->b:Ljava/lang/String;

    iget-object v2, p0, Llpf;->c:Ljava/lang/String;

    iget-object v3, p0, Llpf;->d:Ljava/lang/String;

    iget-object v4, p0, Llpf;->e:Ljava/lang/String;

    iget-object v5, p0, Llpf;->f:Ljava/lang/String;

    iget-boolean v6, p0, Llpf;->g:Z

    iget-object v7, p0, Llpf;->h:Ljava/lang/String;

    iget-object v8, p0, Llpf;->i:Ljava/lang/String;

    iget-object v9, p0, Llpf;->j:Lcom/leanplum/ActionContext;

    invoke-static/range {v0 .. v11}, Lcom/leanplum/messagetemplates/OperaWallpaperSheet;->a(Lcom/opera/android/BrowserActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Lcom/leanplum/ActionContext;Lorm;Lkotlin/Pair;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
