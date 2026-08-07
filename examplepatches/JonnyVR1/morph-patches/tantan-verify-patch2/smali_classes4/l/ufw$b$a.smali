.class public Ll/ufw$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ufw$b;->z(Ll/ufw$c;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;

.field public final synthetic b:Ll/ufw$c;

.field public final synthetic c:Ll/ufw$b;


# direct methods
.method public constructor <init>(Ll/ufw$b;Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;Ll/ufw$c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ufw$b$a;->c:Ll/ufw$b;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ufw$b$a;->a:Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;

    .line 4
    .line 5
    iput-object p3, p0, Ll/ufw$b$a;->b:Ll/ufw$c;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ufw$b$a;->a:Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;->selected:Z

    .line 4
    .line 5
    xor-int/lit8 v1, v0, 0x1

    .line 6
    .line 7
    iput-boolean v1, p1, Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;->selected:Z

    .line 8
    .line 9
    iget-object p1, p0, Ll/ufw$b$a;->b:Ll/ufw$c;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p1, Ll/ufw$c;->a:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget v1, Ll/c9c0;->c2:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/ufw$b$a;->b:Ll/ufw$c;

    .line 31
    .line 32
    iget-object p1, p1, Ll/ufw$c;->a:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget v1, Ll/dbc0;->u:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget-object p1, p1, Ll/ufw$c;->a:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 53
    .line 54
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    sget v1, Ll/c9c0;->q0:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/ufw$b$a;->b:Ll/ufw$c;

    .line 68
    .line 69
    iget-object p1, p1, Ll/ufw$c;->a:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 70
    .line 71
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    sget v1, Ll/dbc0;->U0:I

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 84
    .line 85
    .line 86
    :goto_0
    iget-object p0, p0, Ll/ufw$b$a;->c:Ll/ufw$b;

    .line 87
    .line 88
    iget-object p0, p0, Ll/ufw$b;->b:Ll/x20;

    .line 89
    .line 90
    if-eqz p0, :cond_1

    .line 91
    .line 92
    invoke-interface {p0}, Ll/x20;->call()V

    .line 93
    .line 94
    .line 95
    :cond_1
    return-void
.end method
