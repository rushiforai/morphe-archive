.class public final synthetic Ll/tip;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hjp;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/hjp;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tip;->a:Ll/hjp;

    iput-object p2, p0, Ll/tip;->b:Ljava/util/ArrayList;

    iput-object p3, p0, Ll/tip;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tip;->a:Ll/hjp;

    iget-object v1, p0, Ll/tip;->b:Ljava/util/ArrayList;

    iget-object p0, p0, Ll/tip;->c:Ljava/lang/String;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Ll/hjp;->D0(Ll/hjp;Ljava/util/ArrayList;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method
