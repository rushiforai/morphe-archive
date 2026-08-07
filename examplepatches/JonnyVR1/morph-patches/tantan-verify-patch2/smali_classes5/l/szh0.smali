.class public final synthetic Ll/szh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wzh0;


# direct methods
.method public synthetic constructor <init>(Ll/wzh0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/szh0;->a:Ll/wzh0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/szh0;->a:Ll/wzh0;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/wzh0;->d(Ll/wzh0;Ljava/util/List;)V

    return-void
.end method
