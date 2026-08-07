.class public final synthetic Ll/qsi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/widget/TextView;

.field public final synthetic b:Ljava/lang/CharSequence;

.field public final synthetic c:Ljava/lang/CharSequence;

.field public final synthetic d:I

.field public final synthetic e:Lkotlin/jvm/functions/Function3;

.field public final synthetic f:Lkotlin/jvm/functions/Function1;

.field public final synthetic g:Ljava/lang/CharSequence;

.field public final synthetic h:Z

.field public final synthetic i:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function1;Ljava/lang/CharSequence;ZLkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qsi0;->a:Landroid/widget/TextView;

    iput-object p2, p0, Ll/qsi0;->b:Ljava/lang/CharSequence;

    iput-object p3, p0, Ll/qsi0;->c:Ljava/lang/CharSequence;

    iput p4, p0, Ll/qsi0;->d:I

    iput-object p5, p0, Ll/qsi0;->e:Lkotlin/jvm/functions/Function3;

    iput-object p6, p0, Ll/qsi0;->f:Lkotlin/jvm/functions/Function1;

    iput-object p7, p0, Ll/qsi0;->g:Ljava/lang/CharSequence;

    iput-boolean p8, p0, Ll/qsi0;->h:Z

    iput-object p9, p0, Ll/qsi0;->i:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/qsi0;->a:Landroid/widget/TextView;

    iget-object v1, p0, Ll/qsi0;->b:Ljava/lang/CharSequence;

    iget-object v2, p0, Ll/qsi0;->c:Ljava/lang/CharSequence;

    iget v3, p0, Ll/qsi0;->d:I

    iget-object v4, p0, Ll/qsi0;->e:Lkotlin/jvm/functions/Function3;

    iget-object v5, p0, Ll/qsi0;->f:Lkotlin/jvm/functions/Function1;

    iget-object v6, p0, Ll/qsi0;->g:Ljava/lang/CharSequence;

    iget-boolean v7, p0, Ll/qsi0;->h:Z

    iget-object v8, p0, Ll/qsi0;->i:Lkotlin/jvm/functions/Function1;

    invoke-static/range {v0 .. v8}, Ll/psi0$c;->a(Landroid/widget/TextView;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function1;Ljava/lang/CharSequence;ZLkotlin/jvm/functions/Function1;)V

    return-void
.end method
