.class public final Lith;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/CharSequence;

.field public final c:[Ljava/lang/CharSequence;

.field public final d:Z

.field public final e:I

.field public final f:Landroid/os/Bundle;

.field public final g:Ljava/util/HashSet;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/CharSequence;[Ljava/lang/CharSequence;ZILandroid/os/Bundle;Ljava/util/HashSet;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lith;->a:Ljava/lang/String;

    iput-object p2, p0, Lith;->b:Ljava/lang/CharSequence;

    iput-object p3, p0, Lith;->c:[Ljava/lang/CharSequence;

    iput-boolean p4, p0, Lith;->d:Z

    iput p5, p0, Lith;->e:I

    iput-object p6, p0, Lith;->f:Landroid/os/Bundle;

    iput-object p7, p0, Lith;->g:Ljava/util/HashSet;

    const/4 p0, 0x2

    if-ne p5, p0, :cond_1d

    if-nez p4, :cond_1d

    const-string p0, "setEditChoicesBeforeSending requires setAllowFreeFormInput"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    :cond_1d
    return-void
.end method
