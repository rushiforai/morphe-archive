.class public final synthetic Ll/jm40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jm40;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/jm40;->b:Ljava/lang/String;

    iput p3, p0, Ll/jm40;->c:I

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jm40;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/jm40;->b:Ljava/lang/String;

    iget p0, p0, Ll/jm40;->c:I

    invoke-static {v0, v1, p0}, Ll/cn40;->u(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V

    return-void
.end method
