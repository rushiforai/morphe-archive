.class public final synthetic Ll/tcp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic a:Ll/xcp;


# direct methods
.method public synthetic constructor <init>(Ll/xcp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tcp;->a:Ll/xcp;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tcp;->a:Ll/xcp;

    invoke-static {p0, p1, p2}, Ll/xcp;->e(Ll/xcp;Landroid/widget/CompoundButton;Z)V

    return-void
.end method
