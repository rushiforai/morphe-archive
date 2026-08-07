.class public final synthetic Ll/oy40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lv/VImage;

.field public final synthetic b:Lv/VImage;

.field public final synthetic c:[Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lv/VImage;Lv/VImage;[Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oy40;->a:Lv/VImage;

    iput-object p2, p0, Ll/oy40;->b:Lv/VImage;

    iput-object p3, p0, Ll/oy40;->c:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oy40;->a:Lv/VImage;

    iget-object v1, p0, Ll/oy40;->b:Lv/VImage;

    iget-object p0, p0, Ll/oy40;->c:[Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Ll/iz40;->p(Lv/VImage;Lv/VImage;[Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
