.class public Ll/joh$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/joh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/joh;


# direct methods
.method public constructor <init>(Ll/joh;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/joh$a;->a:Ll/joh;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/joh$a;->a:Ll/joh;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/joh;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/joh$a;->a:Ll/joh;

    .line 11
    .line 12
    iget-object v0, v0, Ll/joh;->h:Lv/VRelative;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-lez v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Ll/joh$a;->a:Ll/joh;

    .line 21
    .line 22
    invoke-static {v0}, Ll/joh;->d(Ll/joh;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object v1, p0, Ll/joh$a;->a:Ll/joh;

    .line 27
    .line 28
    iget-object v1, v1, Ll/joh;->h:Lv/VRelative;

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-ne v0, v1, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-object v0, p0, Ll/joh$a;->a:Ll/joh;

    .line 38
    .line 39
    iget v1, v0, Ll/joh;->t:I

    .line 40
    .line 41
    iget-object v2, v0, Ll/joh;->h:Lv/VRelative;

    .line 42
    .line 43
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    add-int/2addr v1, v2

    .line 48
    iput v1, v0, Ll/joh;->u:I

    .line 49
    .line 50
    iget-object v0, p0, Ll/joh$a;->a:Ll/joh;

    .line 51
    .line 52
    iget-object v1, v0, Ll/joh;->h:Lv/VRelative;

    .line 53
    .line 54
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-static {v0, v1}, Ll/joh;->e(Ll/joh;I)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/joh$a;->a:Ll/joh;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/joh;->s()V

    .line 64
    .line 65
    .line 66
    :cond_2
    :goto_0
    return-void
.end method
