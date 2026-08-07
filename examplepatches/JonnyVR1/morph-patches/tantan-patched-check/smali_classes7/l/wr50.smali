.class public final synthetic Ll/wr50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gs50;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/gs50;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wr50;->a:Ll/gs50;

    iput-object p2, p0, Ll/wr50;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wr50;->a:Ll/gs50;

    iget-object p0, p0, Ll/wr50;->b:Ll/y20;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Ll/gs50;->z(Ll/gs50;Ll/y20;Ljava/lang/Long;)V

    return-void
.end method
