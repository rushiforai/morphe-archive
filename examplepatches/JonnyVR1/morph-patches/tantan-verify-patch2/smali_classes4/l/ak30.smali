.class public final synthetic Ll/ak30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/dk30;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/dk30;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ak30;->a:Ll/dk30;

    iput-object p2, p0, Ll/ak30;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/ak30;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ak30;->a:Ll/dk30;

    iget-object v1, p0, Ll/ak30;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/ak30;->c:Z

    check-cast p1, Ll/vg60;

    invoke-static {v0, v1, p0, p1}, Ll/dk30;->i0(Ll/dk30;Ljava/lang/String;ZLl/vg60;)V

    return-void
.end method
