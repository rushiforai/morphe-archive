.class public final synthetic Ll/rp00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xp00;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/xp00;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rp00;->a:Ll/xp00;

    iput-object p2, p0, Ll/rp00;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rp00;->a:Ll/xp00;

    iget-object p0, p0, Ll/rp00;->b:Ljava/lang/String;

    check-cast p1, Landroid/view/View;

    invoke-static {v0, p0, p1}, Ll/xp00;->w(Ll/xp00;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
