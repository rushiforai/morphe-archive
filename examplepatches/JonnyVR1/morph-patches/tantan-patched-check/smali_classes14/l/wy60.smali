.class public final synthetic Ll/wy60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hz60;


# direct methods
.method public synthetic constructor <init>(Ll/hz60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wy60;->a:Ll/hz60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wy60;->a:Ll/hz60;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/hz60;->B(Ll/hz60;Ljava/lang/String;)V

    return-void
.end method
