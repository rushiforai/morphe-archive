.class public final synthetic Ll/ufh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ogh;

.field public final synthetic b:Lv/VEditText;


# direct methods
.method public synthetic constructor <init>(Ll/ogh;Lv/VEditText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ufh;->a:Ll/ogh;

    iput-object p2, p0, Ll/ufh;->b:Lv/VEditText;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ufh;->a:Ll/ogh;

    iget-object p0, p0, Ll/ufh;->b:Lv/VEditText;

    invoke-static {v0, p0, p1}, Ll/ogh;->m(Ll/ogh;Lv/VEditText;Landroid/view/View;)V

    return-void
.end method
