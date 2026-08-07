.class public final synthetic Ll/iok0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lv/bottombar/VBottomBar;

.field public final synthetic b:Lv/bottombar/VBottomBar$b;


# direct methods
.method public synthetic constructor <init>(Lv/bottombar/VBottomBar;Lv/bottombar/VBottomBar$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iok0;->a:Lv/bottombar/VBottomBar;

    iput-object p2, p0, Ll/iok0;->b:Lv/bottombar/VBottomBar$b;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iok0;->a:Lv/bottombar/VBottomBar;

    iget-object p0, p0, Ll/iok0;->b:Lv/bottombar/VBottomBar$b;

    invoke-static {v0, p0, p1}, Lv/bottombar/VBottomBar;->c(Lv/bottombar/VBottomBar;Lv/bottombar/VBottomBar$b;Landroid/view/View;)V

    return-void
.end method
