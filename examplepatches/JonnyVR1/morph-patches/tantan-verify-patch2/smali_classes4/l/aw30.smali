.class public final synthetic Ll/aw30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b240;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/b240;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aw30;->a:Ll/b240;

    iput-object p2, p0, Ll/aw30;->b:Ljava/lang/String;

    iput p3, p0, Ll/aw30;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/aw30;->a:Ll/b240;

    iget-object v1, p0, Ll/aw30;->b:Ljava/lang/String;

    iget p0, p0, Ll/aw30;->c:I

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {v0, v1, p0, p1}, Ll/b240;->p1(Ll/b240;Ljava/lang/String;ILcom/p1/mobile/android/app/c;)V

    return-void
.end method
