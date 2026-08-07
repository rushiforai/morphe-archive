.class public final synthetic Ll/rgv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/w8e;

.field public final synthetic b:Ll/e4d0;


# direct methods
.method public synthetic constructor <init>(Ll/w8e;Ll/e4d0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rgv;->a:Ll/w8e;

    iput-object p2, p0, Ll/rgv;->b:Ll/e4d0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rgv;->a:Ll/w8e;

    iget-object p0, p0, Ll/rgv;->b:Ll/e4d0;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/aiv;->s(Ll/w8e;Ll/e4d0;Ljava/util/List;)V

    return-void
.end method
