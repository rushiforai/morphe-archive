.class public final Lov3;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Ldp6;

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Lcom/opera/android/BrowserActivity;

.field public w:I


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lov3;->v:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lov3;->u:Ljava/lang/Object;

    iget p1, p0, Lov3;->w:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lov3;->w:I

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p1, p0, Lov3;->v:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1, p0}, Lcom/opera/android/BrowserActivity;->V0(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
