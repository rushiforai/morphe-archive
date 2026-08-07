.class public final synthetic Ll/zmb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/rnb0;

.field public final synthetic b:Lv/VImage;

.field public final synthetic c:Lv/VImage;

.field public final synthetic d:Lv/VImage;

.field public final synthetic e:Lv/VImage;


# direct methods
.method public synthetic constructor <init>(Ll/rnb0;Lv/VImage;Lv/VImage;Lv/VImage;Lv/VImage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zmb0;->a:Ll/rnb0;

    iput-object p2, p0, Ll/zmb0;->b:Lv/VImage;

    iput-object p3, p0, Ll/zmb0;->c:Lv/VImage;

    iput-object p4, p0, Ll/zmb0;->d:Lv/VImage;

    iput-object p5, p0, Ll/zmb0;->e:Lv/VImage;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/zmb0;->a:Ll/rnb0;

    iget-object v1, p0, Ll/zmb0;->b:Lv/VImage;

    iget-object v2, p0, Ll/zmb0;->c:Lv/VImage;

    iget-object v3, p0, Ll/zmb0;->d:Lv/VImage;

    iget-object v4, p0, Ll/zmb0;->e:Lv/VImage;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Ll/rnb0;->y(Ll/rnb0;Lv/VImage;Lv/VImage;Lv/VImage;Lv/VImage;Landroid/view/View;)V

    return-void
.end method
