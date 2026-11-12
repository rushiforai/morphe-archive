.class public final Lvp5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lk6l;

.field public final b:Lysl;

.field public c:I

.field public d:Z

.field public e:Z

.field public f:Lcom/opera/android/browser/chromium/ChromiumContainerView;


# direct methods
.method public constructor <init>(Lk6l;Lysl;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvp5;->a:Lk6l;

    iput-object p2, p0, Lvp5;->b:Lysl;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 3

    iget-boolean v0, p0, Lvp5;->d:Z

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iput-boolean p1, p0, Lvp5;->d:Z

    iget-object p0, p0, Lvp5;->b:Lysl;

    if-nez p1, :cond_f

    invoke-interface {p0}, Lysl;->M()V

    return-void

    :cond_f
    invoke-interface {p0}, Lysl;->Z()V

    return-void
.end method
