.class public final synthetic Ll/htf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:Ll/ltf0;


# direct methods
.method public synthetic constructor <init>(Ll/ltf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/htf0;->a:Ll/ltf0;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/htf0;->a:Ll/ltf0;

    invoke-static {p0}, Ll/ltf0;->a(Ll/ltf0;)V

    return-void
.end method
