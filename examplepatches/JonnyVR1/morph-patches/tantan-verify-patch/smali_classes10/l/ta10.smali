.class public final synthetic Ll/ta10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ua10;

.field public final synthetic b:Ll/s910;


# direct methods
.method public synthetic constructor <init>(Ll/ua10;Ll/s910;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ta10;->a:Ll/ua10;

    iput-object p2, p0, Ll/ta10;->b:Ll/s910;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ta10;->a:Ll/ua10;

    iget-object p0, p0, Ll/ta10;->b:Ll/s910;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/ua10;->M3(Ll/ua10;Ll/s910;Ljava/lang/Throwable;)V

    return-void
.end method
