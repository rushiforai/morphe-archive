.class public final synthetic Ll/b100;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/h100;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/h100;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b100;->a:Ll/h100;

    iput-object p2, p0, Ll/b100;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/b100;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b100;->a:Ll/h100;

    iget-object v1, p0, Ll/b100;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/b100;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {v0, v1, p0, p1}, Ll/h100;->d(Ll/h100;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method
