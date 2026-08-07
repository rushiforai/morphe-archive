.class public final synthetic Ll/as70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/Long;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/as70;->a:Ljava/lang/Long;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/as70;->a:Ljava/lang/Long;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/rs70;->N3(Ljava/lang/Long;Ljava/lang/Throwable;)V

    return-void
.end method
