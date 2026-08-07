.class public final synthetic Ll/y5w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Z

.field public final synthetic c:Landroid/widget/CheckBox;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;ZLandroid/widget/CheckBox;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y5w;->a:Ljava/lang/String;

    iput-boolean p2, p0, Ll/y5w;->b:Z

    iput-object p3, p0, Ll/y5w;->c:Landroid/widget/CheckBox;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y5w;->a:Ljava/lang/String;

    iget-boolean v1, p0, Ll/y5w;->b:Z

    iget-object p0, p0, Ll/y5w;->c:Landroid/widget/CheckBox;

    invoke-static {v0, v1, p0}, Ll/c6w;->a(Ljava/lang/String;ZLandroid/widget/CheckBox;)V

    return-void
.end method
