.class public final synthetic Ll/q04;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/m14;

.field public final synthetic b:Ll/y34;


# direct methods
.method public synthetic constructor <init>(Ll/m14;Ll/y34;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q04;->a:Ll/m14;

    iput-object p2, p0, Ll/q04;->b:Ll/y34;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q04;->a:Ll/m14;

    iget-object p0, p0, Ll/q04;->b:Ll/y34;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/m14;->V3(Ll/m14;Ll/y34;Ljava/util/List;)V

    return-void
.end method
