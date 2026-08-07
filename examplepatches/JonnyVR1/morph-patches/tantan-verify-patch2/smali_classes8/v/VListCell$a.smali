.class public Lv/VListCell$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/VListCell;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Ljava/lang/CharSequence;

.field public final b:Ljava/lang/CharSequence;

.field public final c:Ljava/lang/CharSequence;

.field public final d:I

.field public final e:I

.field public final f:I


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Lv/VListCell$a;->b:Ljava/lang/CharSequence;

    .line 8
    .line 9
    iput-object p1, p0, Lv/VListCell$a;->c:Ljava/lang/CharSequence;

    .line 10
    .line 11
    const/4 p1, -0x1

    .line 12
    iput p1, p0, Lv/VListCell$a;->d:I

    .line 13
    .line 14
    iput p1, p0, Lv/VListCell$a;->e:I

    .line 15
    .line 16
    iput p1, p0, Lv/VListCell$a;->f:I

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;III)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 21
    iput-object p2, p0, Lv/VListCell$a;->b:Ljava/lang/CharSequence;

    .line 22
    iput-object p3, p0, Lv/VListCell$a;->c:Ljava/lang/CharSequence;

    .line 23
    iput p4, p0, Lv/VListCell$a;->d:I

    .line 24
    iput p5, p0, Lv/VListCell$a;->e:I

    .line 25
    iput p6, p0, Lv/VListCell$a;->f:I

    return-void
.end method
