.class public final synthetic Ll/jn3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroid/app/Dialog;

.field public final synthetic b:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Dialog;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jn3;->a:Landroid/app/Dialog;

    iput-object p2, p0, Ll/jn3;->b:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jn3;->a:Landroid/app/Dialog;

    iget-object p0, p0, Ll/jn3;->b:Lkotlin/jvm/functions/Function0;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {v0, p0, p1}, Ll/qn3;->a(Landroid/app/Dialog;Lkotlin/jvm/functions/Function0;Ljava/lang/Integer;)V

    return-void
.end method
