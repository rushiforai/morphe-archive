.class public final synthetic Le/e/a/vendor/lang3/ClassUtils$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic $r8$classId:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Le/e/a/vendor/lang3/ClassUtils$3;->$r8$classId:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    iget-byte p0, p0, Le/e/a/vendor/lang3/ClassUtils$3;->$r8$classId:B

    check-cast p1, Ljava/util/Map$Entry;

    packed-switch p0, :pswitch_data_0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p0

    :goto_0
    check-cast p0, Ljava/lang/String;

    return-object p0

    :pswitch_0
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
