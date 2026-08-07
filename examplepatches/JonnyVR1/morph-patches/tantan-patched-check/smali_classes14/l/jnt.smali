.class public final synthetic Ll/jnt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rnt;


# direct methods
.method public synthetic constructor <init>(Ll/rnt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jnt;->a:Ll/rnt;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jnt;->a:Ll/rnt;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {p0, p1}, Ll/rnt;->b(Ll/rnt;Ljava/lang/CharSequence;)V

    return-void
.end method
