.class public final synthetic Ll/yeo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/afo0;

.field public final synthetic b:Landroid/view/ViewGroup;


# direct methods
.method public synthetic constructor <init>(Ll/afo0;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yeo0;->a:Ll/afo0;

    iput-object p2, p0, Ll/yeo0;->b:Landroid/view/ViewGroup;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yeo0;->a:Ll/afo0;

    iget-object p0, p0, Ll/yeo0;->b:Landroid/view/ViewGroup;

    invoke-static {v0, p0}, Ll/afo0;->c(Ll/afo0;Landroid/view/ViewGroup;)V

    return-void
.end method
