.class public final Ljqk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public final b:Lcom/opera/android/suggestion/SuggestionManagerBridge;

.field public final c:Lx5f;

.field public d:Leyi;

.field public e:Ljava/util/List;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Loml;

.field public i:Z

.field public j:Z

.field public k:Z


# direct methods
.method public constructor <init>(Lumi;Lcom/opera/android/suggestion/SuggestionManagerBridge;Lx5f;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljqk;->a:Lumi;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ljqk;->e:Ljava/util/List;

    iput-object p2, p0, Ljqk;->b:Lcom/opera/android/suggestion/SuggestionManagerBridge;

    iput-object p3, p0, Ljqk;->c:Lx5f;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    const/4 v0, 0x0

    iput-object v0, p0, Ljqk;->g:Ljava/lang/String;

    iget-object v1, p0, Ljqk;->e:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    iget-object v1, p0, Ljqk;->b:Lcom/opera/android/suggestion/SuggestionManagerBridge;

    iget-wide v1, v1, Lcom/opera/android/suggestion/SuggestionManagerBridge;->a:J

    invoke-static {v1, v2}, LJ/N;->MFZ1dBII(J)V

    iget-object v1, p0, Ljqk;->h:Loml;

    const/4 v2, 0x0

    if-eqz v1, :cond_19

    invoke-virtual {v1, v2}, Loml;->cancel(Z)Z

    iput-object v0, p0, Ljqk;->h:Loml;

    :cond_19
    iget-object v0, p0, Ljqk;->d:Leyi;

    iget-object v1, p0, Ljqk;->f:Ljava/lang/String;

    iget-object p0, p0, Ljqk;->e:Ljava/util/List;

    invoke-virtual {v0, v1, p0, v2}, Leyi;->k(Ljava/lang/String;Ljava/util/List;Z)Z

    return-void
.end method
