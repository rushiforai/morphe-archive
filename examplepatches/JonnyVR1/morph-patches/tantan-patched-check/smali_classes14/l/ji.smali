.class public final synthetic Ll/ji;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/li;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/li;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ji;->a:Ll/li;

    iput-object p2, p0, Ll/ji;->b:Ljava/lang/String;

    iput p3, p0, Ll/ji;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ji;->a:Ll/li;

    iget-object v1, p0, Ll/ji;->b:Ljava/lang/String;

    iget p0, p0, Ll/ji;->c:I

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Ll/li;->k(Ll/li;Ljava/lang/String;ILjava/util/List;)V

    return-void
.end method
