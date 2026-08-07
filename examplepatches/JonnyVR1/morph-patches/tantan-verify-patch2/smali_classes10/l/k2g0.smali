.class public final synthetic Ll/k2g0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/i6t;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/i6t;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k2g0;->a:Ll/i6t;

    iput-object p2, p0, Ll/k2g0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k2g0;->a:Ll/i6t;

    iget-object p0, p0, Ll/k2g0;->b:Ljava/lang/String;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/m2g0;->b(Ll/i6t;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method
