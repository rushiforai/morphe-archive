.class public final synthetic Ll/nfl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/yfl;


# direct methods
.method public synthetic constructor <init>(Ll/yfl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nfl;->a:Ll/yfl;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nfl;->a:Ll/yfl;

    invoke-static {p0}, Ll/yfl;->F(Ll/yfl;)V

    return-void
.end method
