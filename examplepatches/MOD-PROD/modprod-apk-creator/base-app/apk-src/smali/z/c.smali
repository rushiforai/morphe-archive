.class public final Lz/c;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Lz/c;

.field public static final d:Lz/c;

.field public static final e:Lz/c;

.field public static final f:Lz/c;


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    new-instance v0, Lz/c;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/16 v2, 0x20

    invoke-direct {v0, v1, v2, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/16 v3, 0x40

    invoke-direct {v0, v1, v3, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/16 v3, 0x80

    invoke-direct {v0, v1, v3, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/16 v3, 0x100

    const-class v4, Lz/j;

    invoke-direct {v0, v1, v3, v4}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/16 v3, 0x200

    invoke-direct {v0, v1, v3, v4}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/16 v3, 0x400

    const-class v4, Lz/k;

    invoke-direct {v0, v1, v3, v4}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/16 v3, 0x800

    invoke-direct {v0, v1, v3, v4}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/16 v3, 0x1000

    invoke-direct {v0, v1, v3, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    sput-object v0, Lz/c;->c:Lz/c;

    new-instance v0, Lz/c;

    const/16 v3, 0x2000

    invoke-direct {v0, v1, v3, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    sput-object v0, Lz/c;->d:Lz/c;

    new-instance v0, Lz/c;

    const/16 v3, 0x4000

    invoke-direct {v0, v1, v3, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const v3, 0x8000

    invoke-direct {v0, v1, v3, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/high16 v3, 0x10000

    invoke-direct {v0, v1, v3, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/high16 v3, 0x20000

    const-class v4, Lz/o;

    invoke-direct {v0, v1, v3, v4}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/high16 v3, 0x40000

    invoke-direct {v0, v1, v3, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/high16 v3, 0x80000

    invoke-direct {v0, v1, v3, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/high16 v3, 0x100000

    invoke-direct {v0, v1, v3, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/high16 v3, 0x200000

    const-class v4, Lz/p;

    invoke-direct {v0, v1, v3, v4}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    sget-object v4, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_SHOW_ON_SCREEN:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    const v5, 0x1020036

    invoke-direct {v0, v4, v5, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    sget-object v4, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_SCROLL_TO_POSITION:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    const-class v5, Lz/m;

    const v6, 0x1020037

    invoke-direct {v0, v4, v6, v5}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    sget-object v4, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_SCROLL_UP:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    const v5, 0x1020038

    invoke-direct {v0, v4, v5, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    sput-object v0, Lz/c;->e:Lz/c;

    new-instance v0, Lz/c;

    sget-object v4, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_SCROLL_LEFT:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    const v5, 0x1020039

    invoke-direct {v0, v4, v5, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    sget-object v4, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_SCROLL_DOWN:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    const v5, 0x102003a

    invoke-direct {v0, v4, v5, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    sput-object v0, Lz/c;->f:Lz/c;

    new-instance v0, Lz/c;

    sget-object v4, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_SCROLL_RIGHT:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    const v5, 0x102003b

    invoke-direct {v0, v4, v5, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/16 v4, 0x1d

    if-lt v3, v4, :cond_0

    invoke-static {}, LN/a;->h()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    move-result-object v5

    goto :goto_0

    :cond_0
    move-object v5, v1

    :goto_0
    const v6, 0x1020046

    invoke-direct {v0, v5, v6, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    if-lt v3, v4, :cond_1

    invoke-static {}, LN/a;->o()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    move-result-object v5

    goto :goto_1

    :cond_1
    move-object v5, v1

    :goto_1
    const v6, 0x1020047

    invoke-direct {v0, v5, v6, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    if-lt v3, v4, :cond_2

    invoke-static {}, LN/a;->s()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    move-result-object v5

    goto :goto_2

    :cond_2
    move-object v5, v1

    :goto_2
    const v6, 0x1020048

    invoke-direct {v0, v5, v6, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    if-lt v3, v4, :cond_3

    invoke-static {}, LN/a;->u()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    move-result-object v4

    goto :goto_3

    :cond_3
    move-object v4, v1

    :goto_3
    const v5, 0x1020049

    invoke-direct {v0, v4, v5, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    sget-object v4, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_CONTEXT_CLICK:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    const v5, 0x102003c

    invoke-direct {v0, v4, v5, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    sget-object v4, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_SET_PROGRESS:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    const-class v5, Lz/n;

    const v6, 0x102003d

    invoke-direct {v0, v4, v6, v5}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/16 v4, 0x1a

    if-lt v3, v4, :cond_4

    invoke-static {}, LS/a;->e()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    move-result-object v4

    goto :goto_4

    :cond_4
    move-object v4, v1

    :goto_4
    const-class v5, Lz/l;

    const v6, 0x1020042

    invoke-direct {v0, v4, v6, v5}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/16 v4, 0x1c

    if-lt v3, v4, :cond_5

    invoke-static {}, Landroidx/emoji2/text/b;->k()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    move-result-object v5

    goto :goto_5

    :cond_5
    move-object v5, v1

    :goto_5
    const v6, 0x1020044

    invoke-direct {v0, v5, v6, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    if-lt v3, v4, :cond_6

    invoke-static {}, Landroidx/emoji2/text/b;->s()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    move-result-object v4

    goto :goto_6

    :cond_6
    move-object v4, v1

    :goto_6
    const v5, 0x1020045

    invoke-direct {v0, v4, v5, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/16 v4, 0x1e

    if-lt v3, v4, :cond_7

    invoke-static {}, LS/e;->e()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    move-result-object v5

    goto :goto_7

    :cond_7
    move-object v5, v1

    :goto_7
    const v6, 0x102004a

    invoke-direct {v0, v5, v6, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    if-lt v3, v4, :cond_8

    invoke-static {}, LS/e;->i()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    move-result-object v4

    goto :goto_8

    :cond_8
    move-object v4, v1

    :goto_8
    const v5, 0x1020054

    invoke-direct {v0, v4, v5, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    if-lt v3, v2, :cond_9

    invoke-static {}, Lz/b;->a()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    move-result-object v4

    goto :goto_9

    :cond_9
    move-object v4, v1

    :goto_9
    const v5, 0x1020055

    invoke-direct {v0, v4, v5, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    if-lt v3, v2, :cond_a

    invoke-static {}, Lz/b;->b()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    move-result-object v4

    goto :goto_a

    :cond_a
    move-object v4, v1

    :goto_a
    const v5, 0x1020056

    invoke-direct {v0, v4, v5, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    if-lt v3, v2, :cond_b

    invoke-static {}, Lz/b;->c()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    move-result-object v2

    goto :goto_b

    :cond_b
    move-object v2, v1

    :goto_b
    const v4, 0x1020057

    invoke-direct {v0, v2, v4, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/16 v2, 0x21

    if-lt v3, v2, :cond_c

    invoke-static {}, Landroidx/activity/m;->a()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    move-result-object v2

    goto :goto_c

    :cond_c
    move-object v2, v1

    :goto_c
    const v4, 0x1020058

    invoke-direct {v0, v2, v4, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    new-instance v0, Lz/c;

    const/16 v2, 0x22

    if-lt v3, v2, :cond_d

    invoke-static {}, Lz/f;->a()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    move-result-object v2

    goto :goto_d

    :cond_d
    move-object v2, v1

    :goto_d
    const v3, 0x102005e

    invoke-direct {v0, v2, v3, v1}, Lz/c;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;ILjava/lang/Class;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lz/c;->b:I

    if-nez p1, :cond_0

    new-instance p1, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    const/4 p3, 0x0

    invoke-direct {p1, p2, p3}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;-><init>(ILjava/lang/CharSequence;)V

    iput-object p1, p0, Lz/c;->a:Ljava/lang/Object;

    return-void

    :cond_0
    iput-object p1, p0, Lz/c;->a:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lz/c;

    if-nez v1, :cond_1

    return v0

    :cond_1
    check-cast p1, Lz/c;

    iget-object p1, p1, Lz/c;->a:Ljava/lang/Object;

    iget-object v1, p0, Lz/c;->a:Ljava/lang/Object;

    if-nez v1, :cond_2

    if-eqz p1, :cond_3

    return v0

    :cond_2
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    return v0

    :cond_3
    const/4 p1, 0x1

    return p1
.end method

.method public final hashCode()I
    .locals 1

    iget-object v0, p0, Lz/c;->a:Ljava/lang/Object;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AccessibilityActionCompat: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lz/c;->b:I

    invoke-static {v1}, Lz/h;->b(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "ACTION_UNKNOWN"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lz/c;->a:Ljava/lang/Object;

    move-object v3, v2

    check-cast v3, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->getLabel()Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_0

    check-cast v2, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->getLabel()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
