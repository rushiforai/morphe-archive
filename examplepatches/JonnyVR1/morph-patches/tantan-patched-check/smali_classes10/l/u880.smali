.class public final synthetic Ll/u880;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/a980;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/a980;Ljava/lang/String;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u880;->a:Ll/a980;

    iput-object p2, p0, Ll/u880;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/u880;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u880;->a:Ll/a980;

    iget-object v1, p0, Ll/u880;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/u880;->c:Ll/y20;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, p0, p1}, Ll/a980;->b(Ll/a980;Ljava/lang/String;Ll/y20;Ljava/lang/Long;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
