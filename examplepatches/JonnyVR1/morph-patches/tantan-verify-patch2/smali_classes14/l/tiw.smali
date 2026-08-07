.class public final synthetic Ll/tiw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tiw;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/tiw;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/tiw;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tiw;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/tiw;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/tiw;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/android/app/Act$r;

    invoke-static {v0, v1, p0, p1}, Ll/wiw;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Act$r;)V

    return-void
.end method
